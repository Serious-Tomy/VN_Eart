using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using vinkn;

public class CustoPuzzle : MonoBehaviour
{
    [SerializeField] GameObject puzzle;
    [SerializeField] CameraSytem cameraSystem;

    // Start is called before the first frame update
    void Start()
    {
        cameraSystem.enabled = false;
        puzzle.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }


    public void ActivatePuzzle(StoryReader reader, object[] parametreVariable)
    {
        Debug.Log("vrai");
        bool active = GameObjectUtility.AsType<bool>(parametreVariable[0]);
        SetPuzzleActive(active);
    }

    public void SetPuzzleActive(bool active)
    {
        cameraSystem.enabled = active;
        puzzle.SetActive(active);
    }
}
