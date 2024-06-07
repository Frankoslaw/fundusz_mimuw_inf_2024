#include <mpi.h>
#include <iostream>
#include <limits.h>

int f(int x, int y)
{
    return x + 2 * y;
}

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);

    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int local_min_path = INT_MAX;
    if (world_rank == 0)
    {
        local_min_path = 0;

        // for (int row = 0; row < world_size; row++)
        // {
        //     for (int col = 0; col < world_size; col++)
        //     {
        //         std::cout << f(col, row) << ' ';
        //     }
        //     std::cout << '\n';
        // }
    }

    for (int col = 0; col < world_size; col++)
    {
        int up = INT_MAX;
        if (world_rank > 0)
        {
            MPI_Recv(&up, 1, MPI_INT, world_rank - 1, col, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        }

        local_min_path = std::min(local_min_path, up) + f(col, world_rank);
        if (world_rank + 1 < world_size)
        {
            MPI_Send(&local_min_path, 1, MPI_INT, world_rank + 1, col, MPI_COMM_WORLD);
        }
    }

    if (world_rank == world_size - 1)
    {
        std::cout << "Shortest path through f(x, y) is: " << local_min_path << '\n';
    }

    MPI_Finalize();
    return 0;
}