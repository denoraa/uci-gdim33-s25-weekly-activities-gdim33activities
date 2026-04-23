using UnityEngine;
using Unity.VisualScripting;

namespace W4Activity
{
    public class DialogueAdvancerW4 : MonoBehaviour
    {
        // Singleton stuff- allows this class to be accessed from anywhere in the codebase without a reference (like a member variable)
        // do not edit this line
        public static DialogueAdvancerW4 _Instance {get; private set;}

        // More Singleton stuff
        // do not edit this method
        private void Awake() {
            if (_Instance != null && _Instance != this) {
                Destroy(this);
                return;
            }

            _Instance = this;
        }

        // Button hooks up to this method
        // do not edit this method
        public void ChooseDialogue (DialogueNodeW4 nextLine)
        {
            EventBus.Trigger(VsEventNames.NewDialogueEvent, nextLine);
        }
    }
}