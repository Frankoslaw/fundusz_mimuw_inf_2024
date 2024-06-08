#include <mpi.h>
#include <iostream>
#include <limits.h>

int f(int x, int y)
{
    return x + 2 * y;
}

int main(int argc, char **argv)
{
    // Target to calculate path to
    bool display_grid = false;
    const int grid_size = 1e4;
    int target_x = grid_size - 1;
    int target_y = grid_size - 1;

    MPI_Init(&argc, &argv);

    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    if (world_rank == 0 && display_grid)
    {
        for (int row = 0; row < grid_size; row++)
        {
            for (int col = 0; col < grid_size; col++)
            {
                std::cout << f(col, row) << ' ';
            }
            std::cout << '\n';
        }
    }

    int local_min_path;

    for (int row = world_rank; row < grid_size; row += world_size)
    {
        local_min_path = INT_MAX;
        if (world_rank == 0)
        {
            local_min_path = 0;
        }

        for (int col = 0; col < grid_size; col++)
        {
            int up = INT_MAX;

            if (row > 0)
            {
                MPI_Recv(&up, 1, MPI_INT, (row - 1) % world_size, col, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            }

            local_min_path = std::min(local_min_path, up) + f(col, row);
            if (row + 1 < grid_size)
            {
                MPI_Send(&local_min_path, 1, MPI_INT, (row + 1) % world_size, col, MPI_COMM_WORLD);
            }

            if (row == target_y and col == target_x)
            {
                std::cout << "Shortest path to f(" << target_x << ',' << target_y << ") is: " << local_min_path << '\n';
            }
        }
    }

    MPI_Finalize();
    return 0;
}