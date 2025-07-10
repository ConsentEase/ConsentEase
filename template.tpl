// Copyright 2025 ConsentEase

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

___INFO___

{
  "displayName": "ConsentEase Consent Management",
  "description": "Integrate ConsentEase cookie consent management platform with Google Tag Manager. This template loads the ConsentEase banner script and properly configures Google Consent Mode based on user choices.",
  "categories": ["UTILITY", "CONVERSIONS"],
  "securityGroups": [],
  "id": "consentease_cmp",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "",
    "displayName": "ConsentEase",
    "id": "consentease"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "Enter your ConsentEase Website ID from your dashboard. You can find this in your ConsentEase account under Website Settings.",
    "displayName": "Website ID",
    "defaultValue": "",
    "name": "websiteId",
    "type": "TEXT"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://consentease.dev/*"
              }
            ]
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
const injectScript = require('injectScript');

// Template configuration
const websiteId = data.websiteId;

log('ConsentEase GTM Template - Website ID:', websiteId);

if (!websiteId) {
  log('ERROR: Website ID is required');
  data.gtmOnFailure();
  return;
}

// ConsentEase master script URL
const MASTER_SCRIPT_URL = 'https://consentease.dev/master.js';

// Load ConsentEase master script
log('Loading ConsentEase master script from:', MASTER_SCRIPT_URL);

injectScript(MASTER_SCRIPT_URL, function() {
  log('ConsentEase master script loaded successfully');
  data.gtmOnSuccess();
}, function() {
  log('Failed to load ConsentEase master script');
  data.gtmOnFailure();
});


___NOTES___

This template integrates ConsentEase cookie consent management with Google Tag Manager.

Setup Instructions:
1. Get your Website ID from ConsentEase dashboard
2. Enter the Website ID in the template configuration
3. Set up triggers (recommend "All Pages" for universal consent)

The template loads the ConsentEase banner script which handles:
- Cookie consent banner display
- Google Consent Mode integration
- GDPR/CCPA compliance
- Real-time consent updates

For support, visit: https://consentease.dev/docs/gtm-integration
