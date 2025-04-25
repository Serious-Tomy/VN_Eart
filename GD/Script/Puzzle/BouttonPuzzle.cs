using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BouttonPuzzle : Puzzle
{


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
        LevierActivable = true;
    }

}
