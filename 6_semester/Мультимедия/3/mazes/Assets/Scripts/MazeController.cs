namespace DefaultNamespace
{
    using System.Linq;
    using UnityEngine;

    public class MazeController : MonoBehaviour
    {
        [SerializeField, Range(0, 1)]
        private float _placementThreshold;
        [SerializeField]
        private Vector2Int _size;
        [SerializeField]
        private Transform _wallParent;
        [SerializeField]
        private GameObject _wallPrefab;
        [SerializeField]
        private Vector2 _prefabSize;

        private void Start()
        {
            _Generate();
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Space))
            {
                _Generate();
            }
        }

        private void _Generate()
        {
            _wallParent.Cast<Transform>().ToList().ForEach(child => Destroy(child.gameObject));
            var maze = MazeGenerator.Generate(_size, _placementThreshold);
            for (var x = 0; x < _size.x; x++)
            {
                for (var y = 0; y < _size.y; y++)
                {
                    if (!maze[x, y]) continue;

                    var placeVector = new Vector2(x * _prefabSize.x, y * _prefabSize.y);
                    Instantiate(
                        _wallPrefab,
                        placeVector,
                        Quaternion.Euler(0, 0, 0),
                        _wallParent
                    );
                }
            }
        }
    }
}