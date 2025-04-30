using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class DetecteurDisque : MonoBehaviour
{
    bool IsInCase;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider col)
    {
        IsInCase = true;
        if (col.CompareTag("Collision") && !Input.GetMouseButton(0))
        {
            Debug.Log("tttttttt");
        }
    }

    private void OnTriggerExit(Collider col)
    {
        if (col.CompareTag("Collision"))
        {
            IsInCase = false;
        }
    }
}
