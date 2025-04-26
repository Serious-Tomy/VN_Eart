using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LumierePuzzle : Puzzle
{
    // Start is called before the first frame update
    void Start()
    {
        box.material = mat_off;
        IsValide = true;
    }

    private void Update()
    {
        
    }

    public void Activate()
    {
        box.material = mat_on;
        Activer = true;
    }

}
