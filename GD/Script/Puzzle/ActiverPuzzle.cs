using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class ActiverPuzzle : Puzzle
{

    [SerializeField] bool Activer;
    [SerializeField] protected Material mat_on;
    [SerializeField] protected Material mat_off;
    [SerializeField] protected MeshRenderer box;
    [SerializeField] AnimManager animManager;
    [SerializeField] string triggerAnim;



    void Start()
    {
        IsValide = Activer;
        box.material = Activer ? mat_on : mat_off;

    }


    void Update()
    {

    }

    private void OnMouseDown()
    {
        if (Activer == true)
        {
            Validate();
            animManager.SetTrigger(triggerAnim);
            Debug.Log("test");
        }
    }
    public void Activate()
    {
        box.material = mat_on;
        Activer = true;
        IsValide = true;
    }

}