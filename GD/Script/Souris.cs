using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class Souris : MonoBehaviour
{
    // Start is called before the first frame update

    private Texture2D arrow;
    
    void Start()
    {
        //Cursor.visible = false;
        Cursor.SetCursor(arrow, Vector2.zero, CursorMode.ForceSoftware);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
