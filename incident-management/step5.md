Looking at `ads-service/ads.py`{{open}}, you'll notice that two sleep commands (Lines 43-44 and Lines 66-67) were left after testing. Close the previous task in the incident remediation. You now have the knowledge to declare the root cause of the incident. Edit the incident on the Incident Overview page and set *root cause* to: `Debug statements left in the ad service code`{{copy}}.

You can now add a final remediation task - "Fix ad service code @[you]". 

Within the IDE, in `ads-service/ads.py`{{open}}, delete the debug lines containing the sleep commands. Changes are auto-saved after a second. (In production, you'd likely make a PR to remedy this issue. You could add this as a note in the incident timeline.)

Removing these lines of code should fix the latency issue. It may take a couple of minutes for the monitor in Datadog to turn green.

Once it does, you can:
- mark your remediation task complete
- in the customer impact section, toggle "Active" off (and adjust the end time if desired)
- change the incident status to "RESOLVED"
