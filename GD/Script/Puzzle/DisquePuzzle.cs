using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DisquePuzzle : MonoBehaviour
{
    [SerializeField] BoxCollider detecteur;
    [SerializeField] DetecteurDisque solution;

    private float angleBefore;


    void Start()
    {
        detecteur.isTrigger = true;
        //detecteur.enabled = false;
    }


    void Update()
    {

    }

    private float MouseAngle()
    {
        Vector3 positionMouse = Input.mousePosition;
        Vector3 positionObject = Camera.main.WorldToScreenPoint(transform.position);

        Vector2 direction = new Vector2(positionMouse.x - positionObject.x, positionMouse.y - positionObject.y);

        float angle = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;

        return angle;
    }

    private void OnMouseDrag()
    {
        if (!enabled)
        {
            return;
        }

        float angleCurrent = MouseAngle();
        float angleDelta = Mathf.DeltaAngle(angleBefore, angleCurrent);
        transform.Rotate(Vector3.up, -angleDelta);
        angleBefore = angleCurrent;
    }

    private void OnMouseUp()
    {
        solution.CheckDisque();
    }

    //private void OnMouseDown()
    //{
    //    detecteur.enabled = false;
    //}
}
