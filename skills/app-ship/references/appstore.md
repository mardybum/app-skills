# App Store rejection risks

Guideline numbers from the App Review Guidelines. When in doubt, check the current version on developer.apple.com.

## High
| Risk | Guideline | Check | Fix |
|---|---|---|---|
| protected names, logos, characters | 5.2.1 | name, icon, screenshots, store text | neutral name ("Deck Buddy"), "unofficial fan app", own art |
| incomplete app, crash, placeholders | 2.1 | release build on a device, all links, no "coming soon" | test paths in the review note, demo data |
| account without demo access | 2.1 | can a reviewer test everything without an own account? | accounts off, or a demo account with data |
| account without deletion | 5.1.1(v) | anyone who can sign up can delete in the app | "Delete account" in the profile |
| third-party login without an equivalent | 4.8 | Google login? | add Sign in with Apple, or email only |
| Kids category | 1.3 | parent gate before links, purchases, settings; no ads, no third-party analytics | KinderKit `ParentGateView` with a typed answer |
| missing contact data | 1.5 | support URL with contact, imprint | support page on the website |
| wrong privacy details | 5.1.2 | privacy manifest matches App Privacy | manifest for app, widget and packages |
| icon with alpha | upload error | `sips -g hasAlpha AppIcon.png` | render without alpha |

## Medium
| Risk | Check | Fix |
|---|---|---|
| wrong device family | does the build claim iPad without working well there? | `TARGETED_DEVICE_FAMILY` per target, iPad tour |
| default language ≠ store language | fresh install in the store language | set the language, add a picker in settings |
| metadata promises too much (2.3) | store text against the features | adjust the text |
| minimum functionality (4.2) | more than a website in a frame? | real native features |
| similar apps from one template (4.3) | content and purpose clearly different? | own content, name, design |
| export compliance | `ITSAppUsesNonExemptEncryption` set? | `NO` in project.yml |
| screenshot sizes | 6.9″, 6.3″, iPad 13″ | rerun the script |
| EU trader status (DSA) | set in App Store Connect? | "not a trader" for a free app of a private person, otherwise trader |

## TestFlight self-test like a reviewer
On your own iPhone, with the TestFlight build:
- [ ] first launch without prior knowledge, onboarding through to the first success
- [ ] the language matches the store primary language
- [ ] every core flow once; the test paths from the review note work
- [ ] help, privacy, imprint and feedback links work
- [ ] kids mode: links and settings ask the parents first
- [ ] airplane mode: no crash
- [ ] permissions (camera, microphone) have clear texts; the app still works after "no"
- [ ] no debug menus, test data or developer notes visible
