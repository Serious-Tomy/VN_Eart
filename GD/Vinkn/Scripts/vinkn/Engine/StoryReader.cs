using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.Events;

namespace vinkn
{
    public class StoryReader : MonoBehaviour
    {
        public enum StoryReadState { NONE, READ, WAIT, RESUME };

        [System.Serializable] public class StoryEventTrigger : UnityEvent<StoryReader, object[]> { }
        [System.Serializable] public class VariableEventTrigger : UnityEvent<string, object> { }
        [System.Serializable]
        public class EventLink
        {
            public string eventName;
            public StoryEventTrigger onTrigger;
        }

        [System.Serializable]
        public class VariableLink
        {
            public string variableName;
            public VariableEventTrigger onTrigger;
        }
        public Story story { get; private set; }

        [Header("Configuration")]
        [SerializeField] bool startOnAwake;
        [SerializeField] TextAsset storyAsset;
        [SerializeField] List<EventLink> eventList;
        [SerializeField] List<VariableLink> variableList;

        [Header("Events")]
        [SerializeField] UnityEvent<string, List<string>> OnNextLine;
        [SerializeField] UnityEvent<List<Choice>> OnChoices;
        [SerializeField] UnityEvent OnStoryEnd;

        public StoryReadState state { get; private set; }

        // Start is called before the first frame update
        void Awake()
        {

            if (storyAsset == null)
            {
                gameObject.SetActive(false);
                throw new UnassignedReferenceException("storyAsset is empty");
            }

            story = new Story(storyAsset.text);
            state = StoryReadState.READ;
            foreach (EventLink e in eventList)
            {
                story.BindExternalFunctionGeneral(e.eventName, (object[] args) => { e.onTrigger?.Invoke(this, args); return null; }, false);
            }

            foreach (VariableLink v in variableList)
            {
                story.ObserveVariable(v.variableName, (string varName, object varValue) => v.onTrigger?.Invoke(varName, varValue));
            }

            // storyDisplay.engine = engine;
            // storyDisplay.ReadTags(story.globalTags, true);

        }

        private void OnEnable()
        {
        }

        private void OnDisable()
        {
        }

        protected virtual IEnumerator Start()
        {
            yield return null;

            if (startOnAwake)
                Next();

        }

        public virtual void Next()
        {
            if (story.canContinue)
            {
                string content = story.Continue().Trim();

                if (string.IsNullOrEmpty(content))
                {
                    Next();
                    return;
                }

                OnNextLine?.Invoke(content, story.currentTags);
            }
            else if (story.currentChoices?.Count > 0)
            {
                OnChoices?.Invoke(story.currentChoices);
            }
            else
            {
                OnStoryEnd?.Invoke();
            }
        }

        public virtual void SelectChoice(Choice choice)
        {
            story.ChooseChoiceIndex(choice.index);
            Next();
        }

        public void CancelWait()
        {
            if (state == StoryReadState.WAIT)
            {
                state = StoryReadState.READ;
            }
        }

        public void ThenWaitPlayer()
        {
            state = StoryReadState.WAIT;
        }

        public void SetStory(TextAsset asset)
        {
            storyAsset = asset;
            story = new Story(asset.text);
        }

    }
}
