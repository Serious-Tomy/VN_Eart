using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class materialswitch : MonoBehaviour
{
    [SerializeField] Material defautMaterial;
    [SerializeField] Material hoverMaterial;
    private Renderer render;

    // Start is called before the first frame update
    void Start()
    {
        render = GetComponent<Renderer>();
        render.material = defautMaterial;
    }

    // Update is called once per frame

    private void OnMouseEnter()
    {
        render.material = hoverMaterial;
    }

    private void OnMouseExit()
    {
        render.material = defautMaterial;
    }

    
}
