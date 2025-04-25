using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Puzzle : MonoBehaviour
{
    protected bool IsValide;
    [SerializeField] protected bool LevierActivable = false;
    [SerializeField] protected UnityEvent OnValidated;
    [SerializeField] protected Material mat_on;
    [SerializeField] protected Material mat_off;
    [SerializeField] protected MeshRenderer box;

    public void Validate()
    {
        if (!IsValide)
        {
            return;
        }

        OnValidated?.Invoke();
        IsValide = false;
        LevierActivable = true;
        Debug.Log("validé");
    }

}
