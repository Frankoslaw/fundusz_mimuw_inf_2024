#include <mpi.h>
#include <iostream>
#include <limits.h>
#include <cmath>
#include <string>
#include <vector>

using namespace std;

const int pass_len = 7;
string result = "BRAK";
string hash_to_crack = "3b9f65739bc06ff99a96bfef7fa813be";

string md5(const string &input)
{
    // Przepisane z https://p...content-available-to-author-only...s.org/besson/publis/notebooks/Manual_implementation_of_some_hash_functions.html na C++
    using u64 = uint64_t;
    using u32 = uint32_t;
    using u8 = uint8_t;

    auto leftrotate = [&](unsigned x, int c)
    {
        return ((x << c) | (x >> (32 - c)));
    };

    const int s[64] = {
        7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
        5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
        4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
        6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21};
    const u32 K[64] = {
        0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee, 0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
        0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be, 0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
        0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa, 0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
        0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed, 0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
        0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c, 0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
        0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05, 0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
        0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039, 0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
        0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1, 0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391};

    unsigned a0 = 0x67452301, b0 = 0xefcdab89, c0 = 0x98badcfe, d0 = 0x10325476;

    vector<u8> data;
    copy(input.begin(), input.end(), back_inserter(data));
    u64 orig_len = input.size() * 8;
    data.push_back(0x80);
    while (data.size() % 64 != 56)
    {
        data.push_back(0);
    }
    for (int i = 0; i < 8; ++i)
    {
        data.push_back(orig_len & 0xFF);
        orig_len >>= 8;
    }

    for (size_t offset = 0; offset < data.size(); offset += 64)
    {
        unsigned A = a0, B = b0, C = c0, D = d0;
        const u8 *chunk = data.data() + offset;
        for (int i = 0; i < 64; ++i)
        {
            unsigned F, g;
            if (i < 16)
            {
                F = ((B & C) | ((~B) & D));
                g = i;
            }
            else if (i < 32)
            {
                F = ((B & D) | (C & (~D)));
                g = (5 * i + 1) % 16;
            }
            else if (i < 48)
            {
                F = B ^ C ^ D;
                g = (3 * i + 5) % 16;
            }
            else
            {
                F = (C ^ (B | (~D)));
                g = (7 * i) % 16;
            }
            const u8 *dword = chunk + (4 * g);
            unsigned x = (((((dword[3] << 8) | dword[2]) << 8) | dword[1]) << 8) | dword[0];
            unsigned r = A + F + K[i] + x;
            A = D;
            D = C;
            C = B;
            B += leftrotate(r, s[i]);
        }
        a0 += A;
        b0 += B;
        c0 += C;
        d0 += D;
    }

    const string hex = "0123456789abcdef";
    string result;
    for (u32 e : {a0, b0, c0, d0})
    {
        for (int i = 0; i < 4; ++i)
        {
            result += hex[(e >> 4) & 0xF];
            result += hex[e & 0xF];
            e >>= 8;
        }
    }
    return result;
}

bool crack_md5(string inp, int pass_len)
{
    if (pass_len)
    {
        for (char i = 'a'; i <= 'z'; i++)
        {
            string local_in = inp + i;
            if (crack_md5(local_in, pass_len - 1))
            {
                return true;
            }
        }
    }
    else
    {
        if (hash_to_crack == md5(inp))
        {
            result = inp;
            cout << "Found hash input: " << result << '\n';
            return true;
        }
    }

    return false;
}

bool crack_md5_with_base(string inp, int pass_len, int inp_len)
{
    for (char i = inp[inp_len - 1]; i <= 'z'; i++)
    {
        string local_in = inp;
        local_in[inp_len - 1] = i;

        if (inp_len == 1)
        {
            if (crack_md5(local_in, pass_len - 1))
            {
                return true;
            }
        }
        else
        {
            if (crack_md5_with_base(local_in, pass_len - 1, inp_len - 1))
            {
                return true;
            }
        }
    }

    return false;
}

int main(int argc, char **argv)
{
    // Target to calculate path to
    MPI_Init(&argc, &argv);

    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int prefix = 26 * 26;
    char first = 'a' + ((prefix / world_size * world_rank) / 26);
    char second = 'a' + ((prefix / world_size * world_rank) % 26);

    crack_md5_with_base((string) "" + first + second, pass_len, 2);

    MPI_Finalize();
    return 0;
}