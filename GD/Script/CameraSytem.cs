using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraSytem : MonoBehaviour
{
    [SerializeField] private float _mousesensivity = 3.0f;
    [SerializeField] private Transform _target;
    [SerializeField] private float _targetDistance = 3.0f;
    [SerializeField] private float _smoothTime = 3.0f;

    private float _rotationY;
    private float _rotationX;

    private Vector3 _currentRotation;
    private Vector3 _smoothVelocity = Vector3.zero;
    


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 nextRotation = new Vector3(_rotationX, _rotationY);
        _currentRotation = Vector3.SmoothDamp(_currentRotation, nextRotation, ref _smoothVelocity, _smoothTime);
        transform.localEulerAngles = _currentRotation;
        transform.position = _target.position - transform.forward * _targetDistance;
        _rotationX = Mathf.Clamp(_rotationX, -40, 40);

        if (Input.GetKey(KeyCode.Mouse1))
        {
            Debug.Log("mouvement");
            Camera();
        }
        
    }


    private void Camera()
    {
        float mouseX = Input.GetAxis("Mouse X") * _mousesensivity;
        float mouseY = Input.GetAxis("Mouse Y") * _mousesensivity;
        _rotationY += mouseX;
        _rotationX += mouseY;
    }
}
