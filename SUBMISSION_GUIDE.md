# ConsentEase GTM Template - Google Community Gallery Submission Guide

## Files Created for Submission

The following files have been prepared according to Google's Community Template Gallery requirements:

### Required Files ✅

1. **`template.tpl`** - The exported GTM template file
   - ✅ Contains required categories: `["UTILITY", "CONVERSIONS", "ANALYTICS"]`
   - ✅ Includes Terms of Service agreement
   - ✅ Complete template configuration and code

2. **`metadata.yaml`** - Template metadata
   - ✅ Homepage URL: `https://consentease.dev`
   - ✅ Documentation URL: `https://consentease.dev/docs/gtm-integration`
   - ✅ Version information with change notes
   - ✅ SHA placeholder for initial commit

3. **`LICENSE`** - Apache 2.0 license (required)
   - ✅ Exact Apache 2.0 license text
   - ✅ Filename in ALL CAPS as required
   - ✅ Copyright notice for ConsentEase

4. **`README.md`** - Documentation (recommended)
   - ✅ Comprehensive installation guide
   - ✅ Configuration instructions
   - ✅ Troubleshooting section
   - ✅ Feature descriptions and compatibility

## Submission Process

### Step 1: Create GitHub Repository
1. Create a new public GitHub repository
2. Repository name suggestion: `consentease-gtm-template`
3. Initialize with the files from this `gtm-gallery/` directory

### Step 2: Upload Files
Upload these files to the **root level** of your repository:
- `template.tpl`
- `metadata.yaml`
- `LICENSE`
- `README.md`

### Step 3: Update metadata.yaml
After your first commit:
1. Copy the commit SHA from GitHub
2. Replace `initial_release_placeholder` in `metadata.yaml` with the actual SHA
3. Commit this change

### Step 4: Submit to Google
1. Sign in to GitHub with access to the repository
2. Go to [tagmanager.google.com/gallery](https://tagmanager.google.com/gallery)
3. Click the menu (⋮) and select **Submit Template**
4. Enter your GitHub repository URL
5. Click **Submit**

## Repository Structure

Your final repository should look like this:
```
consentease-gtm-template/
├── template.tpl
├── metadata.yaml
├── LICENSE
├── README.md
└── (optional: additional documentation)
```

## Important Notes

- **Single Template Only:** Each repository should contain only one `template.tpl` file
- **Main Branch:** All files must be on the main branch
- **Issues Enabled:** Keep GitHub Issues enabled for user support
- **Public Repository:** Repository must be public for gallery inclusion

## Template Features

This template provides:
- External script loading for ConsentEase banner
- Google Consent Mode v2 integration
- GTM consent listener for real-time updates
- GDPR/CCPA compliant defaults
- Comprehensive error handling and debugging
- Support for all ConsentEase customization options

## After Submission

- Google will review the template (typically 2-3 business days)
- Template will appear in the Community Gallery once approved
- Users can then import it directly in their GTM containers
- You can update the template by modifying `metadata.yaml` with new SHA versions

## Support

For questions about this template:
- Check the comprehensive README.md
- Review the installation guide
- Contact ConsentEase support if needed

---

**Ready for submission!** All files comply with Google's Community Template Gallery requirements.