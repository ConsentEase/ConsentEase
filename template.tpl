___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "consentease_cmp",
  "version": 1,
  "securityGroups": [],
  "displayName": "ConsentEase Consent Management",
  "categories": ["UTILITY", "CONVERSIONS", "ANALYTICS"],
  "brand": {
    "id": "consentease",
    "displayName": "ConsentEase",
    "thumbnail": ""
  },
  "description": "Integrate ConsentEase cookie consent management platform with Google Tag Manager. This template loads the ConsentEase banner script and properly configures Google Consent Mode based on user choices.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "websiteId",
    "displayName": "Website ID",
    "simpleValueType": true,
    "help": "Enter your ConsentEase Website ID from your dashboard. You can find this in your ConsentEase account under Website Settings.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

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
