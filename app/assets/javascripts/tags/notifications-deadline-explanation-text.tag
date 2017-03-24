<notifications-deadline-explanation-text>
  <span>
    <strong>{ deadline || "..." } days</strong> before the deadline
    ( <configuration-form title="Configure Deadlines" cell="deadline"/> )
  </span>

  <script>
    import {settingsSelector} from '../selectors'
    this.subscribe(settingsSelector)
  </script>
</notifications-deadline-explanation-text>
