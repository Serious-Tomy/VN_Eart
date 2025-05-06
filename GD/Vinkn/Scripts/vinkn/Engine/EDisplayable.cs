using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace vinkn
{
    public class EDisplayable : MonoBehaviour
    {
        [Header("Definition")]
        [SerializeField] protected string itemID;
        [SerializeField] protected InkObjectType type;
        [Header("Events")]
        [SerializeField] UnityEvent<bool> OnActivate;
        [SerializeField] UnityEvent OnFlipX;
        [SerializeField] UnityEvent OnFlipY;
        [SerializeField] UnityEvent<float, float> OnFade;
        [SerializeField] UnityEvent<Vector3, float> OnMove;
        [SerializeField] UnityEvent<string> OnChangeContent;
        public string tagID => itemID;
        public void Awake()
        {
            VNEngine engine = GameObjectUtility.FindObjectOfType<VNEngine>();
            Init(engine);
        }

        protected virtual void Init(VNEngine engine)
        {
            gameObject.name = "Item_" + itemID;
            engine.Add(this, type);
        }

        private void Start()
        {
            Hide();
        }

        public void Show() => OnActivate?.Invoke(true);
        public void Hide() => OnActivate?.Invoke(false);
        public void Fade(float alpha, float duration) => OnFade?.Invoke(alpha, duration);
        public void Move(Vector3 worldPos, float duration) => OnMove?.Invoke(worldPos, duration);
        public void ChangeContent(string content) => OnChangeContent?.Invoke(content);
        public void FlipX() => OnFlipX?.Invoke();
        public void FlipY() => OnFlipY?.Invoke();
    }
}