using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoitePuzzle : Puzzle
{
    [SerializeField] Material mat_on;
    [SerializeField] Material mat_off;
    [SerializeField] MeshRenderer box;

    // Start is called before the first frame update
    void Start()
    {
        box.material = mat_off;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void Activate()
    {
        box.material = mat_on;
    }
}
