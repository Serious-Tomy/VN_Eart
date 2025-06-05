using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReplacementCamera : MonoBehaviour
{
    [SerializeField] private GameObject cam;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void CameraDeBase()
    {
        cam.transform.position = new Vector3 (0f, 1f, -10f);
        cam.transform.rotation = Quaternion.Euler(0, 0, 0);
    }
}
