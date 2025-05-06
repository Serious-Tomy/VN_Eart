using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NovelCanvas : MonoBehaviour
{
    [SerializeField] CharacterDisplay character;
    [SerializeField] GameObject storyDisplay;
    [SerializeField] ChoiceDisplay choices;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void OnChoicesDisplay(List<Choice> selection)
    {
        DisplayStory(false);
        choices.DisplayChoices(selection);
    }

    public void OnChangeCharacter(SOCharacter ch)
    {
        if (ch != null)
        {
            character.SetCharacter(ch);
            character.gameObject.SetActive(true);
        }
        else
        {
            character.gameObject.SetActive(false);
        }
    }

    public void DisplayStory(bool active)
    {
        if (storyDisplay.activeSelf != active)
        {
            storyDisplay.SetActive(active);
            choices.gameObject.SetActive(!active);
        }
    }
}
