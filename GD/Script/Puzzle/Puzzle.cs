using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Puzzle : MonoBehaviour
{
    protected bool IsValide;
    [SerializeField] protected UnityEvent OnValidated;

    public void Validate()
    {
        if (!IsValide)
        {
            return;
        }

        OnValidated?.Invoke();
        IsValide = false;
        Debug.Log("validé");
    }

}
