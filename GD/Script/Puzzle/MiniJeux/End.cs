using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using DG.Tweening;
using UnityEngine;

public class End : MonoBehaviour
{
    [SerializeField] GameManager gameManager;
  

    private void OnMouseDown()
    {
        gameManager.win = true;
        Debug.Log("fin touché");
    }
}
