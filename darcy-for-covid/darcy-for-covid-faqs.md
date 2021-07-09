# Darcy for Covid FAQs

## Why are we taking temperatures, symptoms and checking for masks?

* Per the California Department of Public Health [guidelines](https://files.covid19.ca.gov/pdf/guidance-schools.pdf) schools need to check for signs and symptoms by “Implement screening and other procedures for all staff and students entering the facility,” and also need to “Monitor staff and students throughout the day for signs of illness; send home students and staff with a fever of 100.4 degrees or higher, cough or other COVID-19 symptoms.” Additionally, “\[f\]ace coverings must be used in accordance with CDPH guidelines unless a person is exempt as explained in the guidelines, particularly in indoor environments, on school buses, and areas where physical distancing alone is not sufficient to prevent disease transmission.” Darcy is designed to check for all those things in a non-contact, unobtrusive way in a matter of seconds with the least amount of disruption to daily routine. 

## Why is data important?

* In some cases, state, county, or others are requiring schools to show compliance in checking for fever and/or symptoms. However, even though not every individual who has Covid-19 is symptomatic, research has shown that in aggregating the data, patterns can emerge to detect outbreaks in advance or be helpful in track and trace. The data can be helpful to keep students and faculty safe and implement thoughtful procedures and targeted quarantining. These reports are only available to each Darcy customer. All data is encrypted, no facial recognition is used, and no PII data is stored on the Darcy device.

## How can Darcy help?

* We are using Darcy as just one of a broad set of measures to ensure safety and peace of mind. While not all sick people have fevers, an elevated temperature is universally accepted as a sign of an immune response and used by all doctors, clinics, and hospitals. In addition to temperature and mask screening, using “Darcy Pass” allows users to report  symptoms and potential exposure, all of which are widely accepted as precautions to limit the spread of Covid-19. It is our belief that during a highly contagious pandemic, we have to take every precaution possible, as even one case can cause an entire school to shut down affecting the lives of all students, teachers and their families.

## What are Darcy’s different modes?

* “Check-in” mode 
  * When in Checkin mode, a Darcy Pass is scanned to ensure that each person entering has been compliant in completing a self-reported questionnaire checking for symptoms and other questions that could put people at a higher risk of exposure. At the same time it will scan for someone’s temperature and mask compliance. 
* "Passby" mode 
  * When Darcy is in “Passby” mode, it is continually scanning for temperatures and masks while people pass by throughout the day. Even if everyone were to self-check at home, people are at school for a significant period of time when symptoms can develop or students stop wearing their masks. Darcy helps automatically monitor for that.

## What happens if Darcy detects a potentially elevated temperature?

* In Check-in mode, Darcy will provide immediate feedback on screen. 
* In Passby mode, no immediate feedback is given on screen to ensure the privacy of the individuals, however authorized administrators may receive private alerts via email or SMS \(configurable in settings\) and can address it immediately and privately with the individual in accordance with the policies of the school.

## What happens if Darcy detects I am not wearing a mask?

* In Check-in mode, Darcy will provide immediate feedback on screen. 
* In Passby mode, no immediate feedback is given on screen to ensure the privacy of the individuals, however authorized administrators may receive private alerts via email or SMS and can address it immediately and privately with the individual in accordance with the policies of the school.

## What if I answer that I have symptoms or have been exposed to Covid-19 in the Darcy Pass questionnaire?

* You won’t receive a valid Darcy Pass and Darcy will alert you and encourage you to stay home. If you attempt to use an invalid Darcy Pass to check-in or enter without one, an authorized administrator may be alerted as above. 

## Is Darcy subject to HIPAA?

* While Darcy/Edgeworx is not considered a Covered Entity or Business Associate, we strive to comply with all HIPAA requirements and recommendations.

## What PII does Darcy capture?

* Darcy captures, processes and stores video and image data locally on the camera. Imagery is not forwarded from the camera, except when SMS or email administrator notifications are explicitly enabled, for which Darcy camera stores the notification phone number and email address.
* On check-in, Darcy camera securely transmits details of that particular check-in \(which includes randomized UUID for Darcy Pass, Temperature reading, and Mask reading\) to Darcy Cloud.
* The Darcy Pass mobile app collects the following information from users on registration:
  * First name, last name
  * Email address
  * Organization \(customer\)
* Darcy Pass mobile app user authentication is performed via OAuth \(such as Google, or Auth0\). The user’s password is never communicated to Darcy/Edgeworx.
* When a Darcy Pass mobile app user submits a survey, the timestamped details of that survey are transmitted to Darcy Cloud from the mobile app. Note that the survey questions are specified by the customer administrator.

## Who has access to Darcy Pass Reports?

* Access to Darcy Pass Reports is limited to customer staff who have been granted the Admin role.

## Where is the data stored?

* Darcy camera processes sensor information \(imagery, temperature\) locally on the camera. All image data is stored locally on the camera itself, and customers can determine what the data retention policies are \(1 day, 7 days, 30 days\).
* Data that is sent from Darcy to Darcy Cloud is stored in a US-based Microsoft Azure database.

## How long does Darcy retain data?

* Darcy camera keeps local image data according to the data retention policy set by the customer \(Darcy owner\) \(1 day, 7 days, 30 days\). 
* Darcy Cloud data is retained for the purposes of customer reports for the period specified by the customer.

## What is Darcy’s Data Security Breach Reporting policy?

* Breaches will be reported to customers and legal authorities per relevant national and local requirements. Note that data stored in Darcy Cloud is subject to California requirements.  

## Can we retrieve our data?

* All data stored in the Darcy Cloud for reporting purposes can be exported in an open format \(e.g. Excel\).

## Who has access to Darcy Cloud data?

* Access to Darcy Cloud data is tightly controlled by Edgeworx DevOps procedures. DevOps staff can only access Darcy Cloud systems on an as-needed basis for specific authorized IT operations.

## Why did Edgeworx make Darcy?

* One of the founders of the company is a mom of 4, and her kids were her inspiration to build something that would check for these things to give peace of mind for all families in these difficult times. Her primary goal was to do so in a way that caused minimal disruption to the lives of teachers and kids. Built with her kids in mind, security and data privacy was of the utmost importance. The underlying technology for this solution has been deployed around the world over the last 5 years, helping governments and businesses provide public safety solutions for first responders to use video and thermal data to save lives in emergency situations.

