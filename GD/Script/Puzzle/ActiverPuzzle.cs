using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class ActiverPuzzle : Puzzle
{

    [SerializeField] bool Activer;
    [SerializeField] AnimManager animManager;
    [SerializeField] string triggerAnim;



    void Start()
    {
        IsValide = Activer;
    }


    void Update()
    {

    }

    private void OnMouseDown()
    {
        if (Activer == true)
        {
            OtherValidate();
        }
    }
    public void Activate()
    {
        Activer = true;
        IsValide = true;
    }

    public void OtherValidate()
    {
        Validate();
        animManager.SetTrigger(triggerAnim);
    }

}