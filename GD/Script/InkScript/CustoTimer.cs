using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using vinkn;

public class CustoTimer : MonoBehaviour
{
    [SerializeField] GameObject timer;
    // Start is called before the first frame update
    void Start()
    {
        timer.SetActive(false);
    }

    public void ActivateTimer(StoryReader reader, object[] parametreVariable)
    {
        Debug.Log("vrai");
        bool active = GameObjectUtility.AsType<bool>(parametreVariable[0]);
        SetTimerActive(active);
    }

    public void SetTimerActive(bool active)
    {
        timer.SetActive(active);
    }
}
