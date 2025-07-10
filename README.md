# ConsentEase GTM Custom Template

A comprehensive Google Tag Manager template that integrates ConsentEase cookie consent management with Google Consent Mode v2 for seamless GDPR/CCPA compliance.

## Overview

The ConsentEase GTM Custom Template allows you to deploy cookie consent banners on your website through Google Tag Manager without adding additional scripts. The template automatically:

- Loads ConsentEase banner script externally
- Integrates with Google Consent Mode v2
- Updates consent states in real-time
- Provides GDPR/CCPA compliant defaults
- Handles consent choices automatically

## Features

### 🎯 **External Script Loading**
- Loads ConsentEase banner from CDN
- No additional scripts needed on your website
- Automatic fallback and error handling

### 🔄 **Google Consent Mode v2 Integration**
- Automatic consent state updates
- Compatible with Google Analytics, Google Ads
- Real-time consent propagation

### 🛡️ **GDPR/CCPA Compliance**
- Consent defaults set to "denied" for compliance
- Granular consent categories support
- Proper consent state management

### 📊 **GTM Event Integration**
- Triggers `consent_update` events in dataLayer
- Seamless integration with existing GTM setup
- Real-time consent listener callbacks

## Installation

### Prerequisites
- Active ConsentEase account
- Google Tag Manager container access
- Website ID from ConsentEase dashboard

### Step 1: Import Template

1. Download the `template.tpl` file
2. In Google Tag Manager, go to **Templates**
3. Click **New** in Tag Templates section
4. Click **Import** and select the template file
5. Click **Save**

### Step 2: Create Tag

1. Go to **Tags** section in GTM
2. Click **New** to create a new tag
3. Choose **ConsentEase Consent Management** template
4. Configure the following settings:

#### Configuration Options

| Setting | Description | Default |
|---------|-------------|---------|
| **Website ID** | Your ConsentEase Website ID | Required |
| **Consent Defaults** | Initial consent state | Denied (recommended) |
| **Enable Debugging** | Console logging for testing | Disabled |

### Step 3: Set Up Triggers

**Recommended Trigger:**
- **Trigger Type:** Page View - All Pages
- **Trigger Name:** All Pages

**Alternative Triggers:**
- Geography-based (EU only)
- Custom page rules
- First-party data triggers

### Step 4: Configure Consent Initialization

Add this Custom HTML tag that fires **before** the ConsentEase tag:

```html
<script>
// Initialize Google Consent Mode
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}

gtag('consent', 'default', {
  'analytics_storage': 'denied',
  'ad_storage': 'denied',
  'ad_user_data': 'denied',
  'ad_personalization': 'denied',
  'functionality_storage': 'denied',
  'personalization_storage': 'denied',
  'security_storage': 'granted'
});
</script>
```

### Step 5: Test & Publish

1. Enable **Preview** mode in GTM
2. Test on your website:
   - Verify banner appears
   - Test consent choices
   - Check console logs (if debugging enabled)
3. **Submit** and **Publish** your container

## Template Configuration

### Website ID
Enter your ConsentEase Website ID from your dashboard. This can be found in:
- ConsentEase Dashboard → Website Settings → Website ID

### Consent Defaults
- **Denied (Recommended):** Complies with GDPR requirements
- **Granted:** Only use if legally compliant in your jurisdiction

### Debugging
- **Enable:** Shows detailed console logs during testing
- **Disable:** Recommended for production environments

## How It Works

1. **Initialization:** Template sets consent defaults when tag fires
2. **Script Loading:** ConsentEase banner script loads externally
3. **Listener Registration:** GTM listener registers with ConsentEase
4. **User Interaction:** User makes consent choices in banner
5. **Consent Update:** ConsentEase notifies GTM listeners
6. **Mode Update:** Google Consent Mode updates automatically
7. **Event Triggering:** `consent_update` event fires in dataLayer

## Consent Categories

The template handles these consent categories:

| ConsentEase Category | Google Consent Mode | Description |
|---------------------|---------------------|-------------|
| **Necessary** | `security_storage` | Always granted |
| **Functional** | `functionality_storage`, `personalization_storage` | User preferences |
| **Analytics** | `analytics_storage` | Usage analytics |
| **Marketing** | `ad_storage`, `ad_user_data`, `ad_personalization` | Advertising |

## Troubleshooting

### Banner Not Appearing
- Verify Website ID is correct
- Check trigger configuration
- Enable debugging and check console logs
- Ensure ConsentEase account is active

### Consent Mode Not Updating
- Verify gtag and dataLayer are initialized
- Check console logs for listener registration
- Ensure consent initialization tag fires first
- Test with Google Tag Assistant

### Script Loading Issues
- Check network connectivity
- Verify ConsentEase CDN access
- Review browser console for errors
- Test with different browsers

## Advanced Usage

### Custom Consent Handling
Listen for consent updates in your own code:

```javascript
// Custom consent listener
if (window.ConsentEase) {
  window.ConsentEase.addConsentListener(function(consentData) {
    console.log('Consent updated:', consentData);
    // Your custom logic here
  });
}
```

### DataLayer Events
The template automatically triggers these events:

```javascript
// Consent update event
{
  'event': 'consent_update',
  'consent_data': {
    'necessary': true,
    'functional': true,
    'analytics': false,
    'marketing': true
  }
}
```

## Support

- **Documentation:** [ConsentEase GTM Integration Guide](https://consentease.dev/docs/gtm-integration)
- **General Support:** [ConsentEase Help Center](https://consentease.dev/support)
- **Issues:** Report issues in this repository's Issues section

## Compatibility

- **GTM:** All versions supporting Custom Templates
- **ConsentEase:** Platform version 2.0+
- **Browsers:** All modern browsers (IE11+ supported)
- **Google Consent Mode:** v2 (backwards compatible with v1)

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request
4. Follow the [Google Tag Manager Template Style Guide](https://developers.google.com/tag-platform/tag-manager/templates/style)

---

**ConsentEase** - Making cookie compliance simple and effective.