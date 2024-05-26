using UnityEngine;
using System.Collections;

namespace TTDemoScripts
{
    public class PlayerHoverController : MonoBehaviour
    {
        public float forwardSpeed = 10;
        public float strafeSpeed = 10;
        public float runMultiplier = 2;
        public KeyCode runKey = KeyCode.LeftShift;
        public LayerMask groundLayer;

        RaycastHit hit;
        float hoverHeight = 0;

        void Awake()
        {

        }

        void Update()
        {

            float y = Input.GetAxis("Vertical") * forwardSpeed * (Input.GetKey(runKey)?runMultiplier:1) *Time.deltaTime;
            float x = Input.GetAxis("Horizontal") * strafeSpeed * Time.deltaTime;

            // hover
            if (Physics.Raycast(transform.position + Vector3.up * 9999, Vector3.down, out hit, Mathf.Infinity, groundLayer))
            {
                hoverHeight = hit.point.y + 1.8f;
            }


            transform.Translate(new Vector3(x, hoverHeight-transform.position.y+1.8f, y));
        }
    }

}
