namespace DefaultNamespace
{
    using UnityEngine;

    public static class MazeGenerator
    {
        public static bool[,] Generate(Vector2Int size, float placementThreshold)
        {
            var (x, y) = (size.x, size.y);
            var maze = new bool[x, y];
            for (var i = 0; i < x; i++)
            {
                for (var j = 0; j < y; j++)
                {
                    TryCreateWall(maze, (i, j), placementThreshold);
                }
            }

            return maze;
        }

        private static void TryCreateWall(
            bool[,] maze,
            (int x, int y) point,
            float placementThreshold
        )
        {
            var (maxX, maxY) = (maze.GetUpperBound(0), maze.GetUpperBound(1));

            if (point.x == 0 || point.y == 0 || point.x == maxX || point.y == maxY)
            {
                maze[point.x, point.y] = true;

                return;
            }

            if (point.x % 2 == 0 && point.y % 2 == 0 && Random.value > placementThreshold)
            {
                maze[point.x, point.y] = true;
                var a = Random.value < .5 ? 0 : (Random.value < .5 ? -1 : 1);
                var b = a != 0 ? 0 : (Random.value < .5 ? -1 : 1);
                maze[point.x + a, point.y + b] = true;
            }
        }
    }
}