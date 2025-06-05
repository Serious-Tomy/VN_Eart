using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class CameraSytem : MonoBehaviour
{
    [SerializeField] private float _mousesensivity = 3.0f;
    [SerializeField] private Transform _target;
    [SerializeField] private float _targetMinDistance = 3.0f;
    [SerializeField] private float _targetMaxDistance = 10.0f;
    [SerializeField] private float _currentDistanceTarget = 3.0f;
    [SerializeField] private float _smoothTime = 3.0f;
    [SerializeField] private float zoomSpeed = 1.0f;


    private float _rotationY;
    private float _rotationX;

    //private float _targetDistance;
    //private float _zoomVelocity = 0f;
    private Vector3 _currentRotation;
    private Vector3 _smoothVelocity = Vector3.zero;
    


    // Start is called before the first frame update
    void Start()
    {
        //_targetDistance = _currentDistanceTarget;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetAxis("Mouse ScrollWheel") > 0f && _currentDistanceTarget >= _targetMaxDistance)
        {
            _currentDistanceTarget -= zoomSpeed;
        }
        else if(Input.GetAxis("Mouse ScrollWheel") < 0f && _currentDistanceTarget <= _targetMinDistance)
        {
            _currentDistanceTarget += zoomSpeed;
        }
        //_targetDistance = Mathf.Clamp(_currentDistanceTarget, _targetMinDistance, _targetMaxDistance);
        //_currentDistanceTarget = Mathf.SmoothDamp(_currentDistanceTarget, _targetDistance, ref _zoomVelocity, _smoothTime);


        Vector3 nextRotation = new Vector3(_rotationX, _rotationY);
        _currentRotation = Vector3.SmoothDamp(_currentRotation, nextRotation, ref _smoothVelocity, _smoothTime);
        transform.localEulerAngles = _currentRotation;
        transform.position = _target.position - transform.forward * _currentDistanceTarget;
        _rotationX = Mathf.Clamp(_rotationX, -90, 70);

        if (Input.GetKey(KeyCode.Mouse1))
        {
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
