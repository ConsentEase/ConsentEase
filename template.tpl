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
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAQCSURBVHic7ZpNaBNBFMefSWxsrVVrP1pttVWxtWKxIh5E8OTBgx70oAcPevBcL3rx4NWLBy8ePHjw4MGjBy9e9ODBgwcPHjx4EEGwVbG1Wq1Wq7X5aN4bJpvMJrvZTXY2yT/wg+xm572Z+e+8j5nJBDAwMDAwMDAwMPxfkBJCTIHNwAhVhIiQJbEIbAdOAjeBRSBR5GcJOAO0VaXWJUYEjqIoR6GbgDvAOrBa9YqVBgnRgFPAL2ATCEKxTFKYH5o6T+Qg8BMYBPaX2EcaOAJsBlrKF6t8GMc/aJTwgDrQlUZW7FqQG4gqsGYRv9Wok9M2G4AXQKTEPhLA/TQ8YAeEHngFXAC6XcqTAI6MiXP3WAjc5bBIi9gPvAaeAK0O68VYBw6nM+u5m2EB3XrUQ4hbtQiKOBmR4/s6dBH0VYtsKdKKnF/VTdCFXHcJLhfnzHl1CfDLSl7K3AvWRdCXnJmOy7mcLBPk7o4NtKfUP1UpONlE4I6ggzpQq3M5WZUI2jJBexGIJPfTebZLx9ElyL2/3BHRnVrHuFKF9poyQXsRUEqXyRfB/giwqKjEqKGjBEAc6NNQWNMGwC7gJRDOO/48KhzEuTdJKkTJEPBdF8Wo0Qis2FwPEeFOh8V4VdZE4FelE8Fn4DdwCBhxWaYUSwDq5mFZBHH+h7gNTALbNJQXNIEb2nEpKG6z/GYd3Q0sJh4Cy8AI8KPUDvhEo8l5S3VZhK+HZxn1PoBFoCvTCRE5LyFOFdnOAeB3qR3wjVBjrNpFLgd5k3Z0Y9LuQmS5KCJzd1QGTvZhJSKPGR94vdL8Ty0C8v8E/VCHzFB3QTQTY6H6dUYSgfF4mhBK5DM7YjJywxWsO2l+sO5LJa/VY8BH4CdmGM8Y7ACBH8Cv5D/Ai/IfoJ8J7CWK7MtJFfJ/g6Ri7PN4eGP4deCPOguWCNK2CyQQ7A8Q1ACkgpL+CL7ZvElKBCXdBAEggpq6CLQKSRHyP0D/EAgyElAnJIUfIANnC/9h/c+lHSHVOHLUH0HgdGGBRpCJu+zfYGgtgSCnOyKwNyKwJzQRCDIBFWgAlrYSCDIBFagBnraBQJAJqEADxOwmYG+XSUS1X2ECEaQr8AEBL0bHr4ZqTa9EfJsODQjNBnpqZeXyTqEaXJdNaGpVBvgYRN8R3AgL7SQNg9d6TdBsxT"
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
      },
      {
        "type": "REGEX",
        "args": [
          "^[0-9a-zA-Z_-]+$"
        ],
        "errorMessage": "Website ID must contain only letters, numbers, hyphens, and underscores"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "consentDefaults",
    "displayName": "Consent Defaults",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "denied",
        "displayValue": "Denied (Recommended for GDPR)"
      },
      {
        "value": "granted",
        "displayValue": "Granted (Use only if legally compliant)"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "denied",
    "help": "Set the default consent state before user interaction. Select 'Denied' for GDPR compliance."
  },
  {
    "type": "CHECKBOX",
    "name": "enableDebugging",
    "checkboxText": "Enable debugging",
    "simpleValueType": true,
    "help": "Enable console logging for debugging purposes. Disable in production."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Import required GTM APIs
const log = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const createQueue = require('createQueue');
const gtagSet = require('gtagSet');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const callInWindow = require('callInWindow');

// Template configuration
const websiteId = data.websiteId;
const consentDefaults = data.consentDefaults || 'denied';
const enableDebugging = data.enableDebugging || false;

// ConsentEase master script URL
const MASTER_SCRIPT_URL = 'https://consentease.dev/master.js';

// Debugging function
function debugLog(message, data) {
  if (enableDebugging) {
    log('[ConsentEase GTM]', message, data || '');
  }
}

// Initialize consent defaults
function initializeConsentDefaults() {
  debugLog('Setting consent defaults:', consentDefaults);
  
  const defaultConsentState = consentDefaults === 'granted' ? 'granted' : 'denied';
  
  gtagSet({
    'analytics_storage': defaultConsentState,
    'ad_storage': defaultConsentState,
    'ad_user_data': defaultConsentState,
    'ad_personalization': defaultConsentState,
    'functionality_storage': defaultConsentState,
    'personalization_storage': defaultConsentState,
    'security_storage': 'granted'
  });
  
  debugLog('Consent defaults set successfully');
}

// GTM consent listener callback
function createGTMConsentListener() {
  return function(consentData) {
    debugLog('GTM Listener received consent update:', consentData);
    
    if (!consentData || typeof consentData !== 'object') {
      debugLog('Invalid consent data received');
      return;
    }
    
    // Update Google Consent Mode based on ConsentEase choices
    const consentUpdate = {
      'analytics_storage': consentData.analytics ? 'granted' : 'denied',
      'ad_storage': consentData.marketing ? 'granted' : 'denied',
      'ad_user_data': consentData.marketing ? 'granted' : 'denied', 
      'ad_personalization': consentData.marketing ? 'granted' : 'denied',
      'functionality_storage': consentData.functional ? 'granted' : 'denied',
      'personalization_storage': consentData.functional ? 'granted' : 'denied'
    };
    
    // Use gtagSet to update consent
    gtagSet(consentUpdate);
    
    debugLog('Updated Google Consent Mode via GTM:', consentUpdate);
    
    // Trigger GTM consent_update event
    const dataLayer = copyFromWindow('dataLayer') || [];
    dataLayer.push({
      'event': 'consent_update',
      'consent_data': consentData,
      'gtm.uniqueEventId': (copyFromWindow('google_tag_manager') || {}).dataLayer.push([])
    });
    
    debugLog('Triggered consent_update event');
  };
}

// Register GTM listener with ConsentEase
function registerGTMListener() {
  const consentEase = copyFromWindow('ConsentEase');
  
  if (consentEase && typeof consentEase.addConsentListener === 'function') {
    const listener = createGTMConsentListener();
    consentEase.addConsentListener(listener);
    debugLog('GTM consent listener registered with ConsentEase');
    return true;
  } else {
    debugLog('ConsentEase API not available for listener registration');
    return false;
  }
}

// Initialize ConsentEase banner
function initializeConsentEase() {
  debugLog('Initializing ConsentEase for website:', websiteId);
  
  // Set website ID globally
  setInWindow('consentEaseWebsiteId', websiteId, false);
  
  // Try to register GTM listener
  if (!registerGTMListener()) {
    // If ConsentEase isn't ready, try again after a short delay
    const retryRegistration = function() {
      if (!registerGTMListener()) {
        debugLog('Retrying GTM listener registration...');
        // Try again in 500ms
        const setTimeout = copyFromWindow('setTimeout');
        if (setTimeout) {
          setTimeout(retryRegistration, 500);
        }
      }
    };
    
    const setTimeout = copyFromWindow('setTimeout');
    if (setTimeout) {
      setTimeout(retryRegistration, 100);
    }
  }
  
  // Initialize ConsentEase if API is available
  const consentEase = copyFromWindow('ConsentEase');
  if (consentEase && typeof consentEase.init === 'function') {
    consentEase.init(websiteId);
    debugLog('ConsentEase initialized');
  } else {
    debugLog('ConsentEase init not available, script may still be loading');
  }
}

// Main template execution
function main() {
  debugLog('ConsentEase GTM Template starting');
  
  // Set consent defaults first
  initializeConsentDefaults();
  
  // Check if ConsentEase is already loaded
  const existingConsentEase = copyFromWindow('ConsentEase');
  if (existingConsentEase) {
    debugLog('ConsentEase already loaded, initializing...');
    initializeConsentEase();
    data.gtmOnSuccess();
    return;
  }
  
  // Load ConsentEase master script
  debugLog('Loading ConsentEase master script from:', MASTER_SCRIPT_URL);
  
  injectScript(MASTER_SCRIPT_URL, function() {
    debugLog('ConsentEase master script loaded successfully');
    
    // Wait a moment for script to initialize
    const setTimeout = copyFromWindow('setTimeout');
    if (setTimeout) {
      setTimeout(function() {
        initializeConsentEase();
      }, 50);
    } else {
      initializeConsentEase();
    }
    
    data.gtmOnSuccess();
  }, function() {
    debugLog('Failed to load ConsentEase master script');
    data.gtmOnFailure();
  });
}

// Execute main function
main();


___WEB_PERMISSIONS___

[
  {
    "type": "inject_script",
    "urls": [
      "https://consentease.dev/*",
      "https://*.consentease.dev/*"
    ]
  },
  {
    "type": "access_globals",
    "keys": [
      {
        "key": "ConsentEase",
        "read": true,
        "write": false,
        "execute": true
      },
      {
        "key": "consentEaseWebsiteId",
        "read": true,
        "write": true,
        "execute": false
      },
      {
        "key": "dataLayer",
        "read": true,
        "write": true,
        "execute": false
      },
      {
        "key": "google_tag_manager",
        "read": true,
        "write": false,
        "execute": false
      },
      {
        "key": "setTimeout",
        "read": true,
        "write": false,
        "execute": true
      }
    ]
  },
  {
    "type": "get_cookies",
    "cookieAccess": "specific",
    "cookieNames": [
      "ce_consent_status_*",
      "ce_consent_preferences_*"
    ]
  },
  {
    "type": "logging",
    "environments": "debug"
  }
]


___NOTES___

This template integrates ConsentEase cookie consent management with Google Tag Manager and Google Consent Mode v2.

Key Features:
- External script loading for ConsentEase banner
- Automatic Google Consent Mode v2 integration  
- GTM consent listener for real-time updates
- GDPR/CCPA compliant consent defaults
- Comprehensive error handling and debugging

Setup Instructions:
1. Get your Website ID from ConsentEase dashboard
2. Configure consent defaults (recommend "Denied" for GDPR)
3. Set up triggers (recommend "All Pages" for universal consent)
4. Enable debugging during testing, disable in production

The template automatically:
- Sets consent defaults before user interaction
- Loads ConsentEase banner script
- Registers GTM listener for consent updates
- Updates Google Consent Mode when users make choices
- Triggers 'consent_update' events in dataLayer

For support, visit: https://consentease.dev/docs/gtm-integration