using UnityEngine;
using System.Collections;

// Just a quick 2d circle movement sample

namespace TTTSamples
{
	public class CircleMoverSample : MonoBehaviour 
	{
		public LayerMask layerMaskGround;
        public float moveSpeed=150f;
		public float jumpForce=20f;
		private float torque = 0;
		private Rigidbody2D rb;

		void Start()
		{
			rb = GetComponent<Rigidbody2D>();
		}

		void Update()
		{
			torque=Input.GetAxis("Horizontal")*moveSpeed*Time.deltaTime;

			if (Input.GetButton("Jump"))
            {
                // check if grounded
				if (Physics2D.Raycast(transform.position, Vector2.down, 0.5f, layerMaskGround))
				{
                    rb.AddForce(Vector2.up * jumpForce * Time.deltaTime, ForceMode2D.Impulse);
				}
            }
        }

		void FixedUpdate () 
		{
			rb.AddTorque(-torque);
		}
	}
}