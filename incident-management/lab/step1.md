In the terminal on the right, the Storedog app is being instrumented for APM with Datadog. Live traffic to the app is also being simulated. This may take up to 2 minutes. Once the app is running, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials.

Once the initialization completes, you can browse the Storedog app by clicking on the `storedog` tab in the terminal to the right. You may notice some long page load times or other broken behavior.

As part of the lab setup, a monitor was established to evaluate the time it takes for the server to handle requests for the home page as measured by the Datadog Agent. It will raise an alert if the latency for the past 1 minute has an average greater than 1 second. The focus of this course is incident management, if you want to understand how to set up APM and this monitor yourself, enroll in the "Introduction to Application Performance Monitoring" course.

Now you're going to log into Datadog and check on the monitor that was created.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com. If you need to recall your credentials, type `creds`{{execute}} in the terminal.

2. Navigate to <a href="https://app.datadoghq.com/monitors/manage" target="_datadog">**Monitors** > **Manage Monitors**</a> in Datadog to view the list of monitors that are being evaluated for your account. The monitor established for this course is titled `Monitor for Incident Management Course`. If you have taken this course before or other courses, you may have multiple copies of this monitor or other monitors, that is okay.

3. If your lab environment was recently created, the monitor status will be gray and state "NO DATA". Refresh the Datadog page until the monitor is in an "ALERT" status before moving to the next step.