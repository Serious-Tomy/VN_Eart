using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace vinkn
{
    public static class GameObjectUtility
    {
        public static T FindObjectOfType<T>() where T : MonoBehaviour
        {
#if UNITY_2023_2_OR_NEWER
            return GameObject.FindFirstObjectByType<T>();
#else
            return GameObject.FindObjectOfType<T>();
#endif
        }

        public static IEnumerator TimedCall<T>(T start, T final, float duration, Action<T, T, float> callback)
        {
            float ellapsed = 0;

            while(ellapsed < duration)
            {
                ellapsed += Time.deltaTime;
                callback?.Invoke(start, final, ellapsed / duration);
                yield return null;
            }

            callback?.Invoke(start, final, 1);
        }

        public static T AsType<T>(object item) => (T)item;
    }
}
