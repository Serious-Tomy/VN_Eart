using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevierPuzzle : Puzzle
{

    // Start is called before the first frame update
    void Start()
    {
        IsValide = true;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnMouseDown()
    {
        Validate();
    }
}
