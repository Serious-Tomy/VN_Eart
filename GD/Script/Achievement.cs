using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Achievement : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //PlayerPrefs.DeleteAll();
        Debug.Log(PlayerPrefs.GetInt("ach1"));
    }

    public void ActiveAchievement()
    {
        PlayerPrefs.SetInt("ach1", 7);
    }
}
