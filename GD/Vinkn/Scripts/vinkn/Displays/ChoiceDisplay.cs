using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class ChoiceDisplay : MonoBehaviour
{
    [SerializeField] ButtonDisplay buttonPrefab;
    [SerializeField] UnityEvent<Choice> OnChoiceSelected;

    // Start is called before the first frame update
    void Start()
    {
        Clear();
    }

    void Clear()
    {
        foreach(Transform child in transform)
        {
            Destroy(child.gameObject);
        }
    }

    public void DisplayChoices(List<Choice> choices)
    {
        Clear();
        foreach(Choice ch in choices)
        {
            ButtonDisplay disp = Instantiate(buttonPrefab, transform);
            disp.SetChoice(ch, OnChoiceSelected.Invoke);
        }
    }
}
