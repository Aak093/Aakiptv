# How to Compile and Install the IPTV Android App (APK)

This guide provides step-by-step instructions on how to compile the Flutter IPTV application into an Android Package Kit (APK) file and install it on your Android TV.

## Option 1: Cloud Build using GitHub Actions (Recommended for users without a computer)

This method allows you to build the APK file using GitHub's cloud infrastructure, without needing to install Flutter or Android Studio on your local machine. You will need a GitHub account.

### Step 1: Create a GitHub Repository

1.  Go to [GitHub](https://github.com/) and sign in or create a new account.
2.  Click on the '+' icon in the top right corner and select 'New repository'.
3.  Give your repository a name (e.g., `iptv_app`), make it `Public` or `Private` as you prefer, and click 'Create repository'.

### Step 2: Upload the Source Code

1.  On your newly created GitHub repository page, click on the 'uploading an existing file' link.
2.  Drag and drop all the files and folders from the `iptv_app` directory (which I provided in the ZIP file) into the upload area. **Make sure to include the `.github` folder as well.**
3.  Scroll down and click 'Commit changes'.

### Step 3: Trigger the GitHub Actions Workflow

1.  Once your code is uploaded, navigate to the 'Actions' tab in your GitHub repository.
2.  On the left sidebar, you should see a workflow named 'Flutter APK Build'. Click on it.
3.  On the workflow page, click the 'Run workflow' button (usually on the right side, under the workflow name). This will start the cloud build process.

### Step 4: Download the APK

1.  After triggering the workflow, you will see a new job running. Click on the running job to view its progress.
2.  Once the job completes successfully (it might take a few minutes), you will see a section called 'Artifacts' at the bottom of the job summary page.
3.  Click on `app-release-apk` to download the generated APK file to your device.

## Option 2: Local Build (Requires a computer with Flutter SDK and Android Studio)

If you have access to a computer and prefer to build the APK locally, follow these instructions.

## Prerequisites

Before you begin, ensure you have the following installed on your development machine:

1.  **Flutter SDK**: Follow the official Flutter installation guide for your operating system: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2.  **Android Studio**: Install Android Studio, which includes the Android SDK and necessary command-line tools: [https://developer.android.com/studio](https://developer.android.com/studio)
3.  **Java Development Kit (JDK)**: Android Studio usually bundles a JDK, but ensure you have JDK 11 or later installed and configured.

## Step 1: Get Flutter Dependencies

Navigate to the `iptv_app` directory in your terminal and fetch the project dependencies:

```bash
flutter pub get
```

## Step 2: Connect an Android Device or Emulator (Optional but Recommended)

It's recommended to test the app on a physical Android TV or an Android TV emulator during development. You can list available devices with:

```bash
flutter devices
```

## Step 3: Build the APK

To build the release APK for your Android TV, run the following command in the `iptv_app` directory:

```bash
bash
flutter build apk --release
```

This command will generate a release APK file. The process might take a few minutes. Once completed, you will find the APK file at:

`build/app/outputs/flutter/apk/app-release.apk`

## Step 4: Install the APK on your Android TV

There are several ways to install an APK on an Android TV:

### Method 1: Using a USB Drive

1.  Copy the `app-release.apk` file to a USB flash drive.
2.  Insert the USB drive into your Android TV.
3.  On your Android TV, use a file manager app (you might need to install one from the Google Play Store on your TV, e.g., File Commander, Solid Explorer) to navigate to the USB drive and install the APK.

### Method 2: Using the Downloader App (Recommended for TV)

This method is particularly useful for Android TV devices like Amazon Fire TV Stick or other devices where direct USB access might be limited.

1.  **Enable Unknown Sources**: On your Android TV, go to `Settings` > `Device Preferences` > `Security & Restrictions` > `Unknown Sources`. Enable this for the `Downloader` app (you might need to install it first from the Google Play Store on your TV).
2.  **Upload APK to a Cloud Service**: Upload your `app-release.apk` file to a cloud storage service (e.g., Google Drive, Dropbox) or a temporary file-sharing service that provides a direct download link.
3.  **Use Downloader App**: Open the `Downloader` app on your Android TV. Enter the direct download URL of your APK file and press `Go`.
4.  **Install**: Once downloaded, the Downloader app will prompt you to install the APK. Follow the on-screen instructions.

### Method 3: Using ADB (Android Debug Bridge)

This method requires connecting your Android TV to your computer via ADB.

1.  **Enable Developer Options and USB Debugging**: On your Android TV, go to `Settings` > `Device Preferences` > `About`. Click on `Build` seven times to enable Developer Options. Then go back to `Device Preferences` > `Developer Options` and enable `USB Debugging`.
2.  **Connect via ADB**: On your computer, open a terminal and navigate to the directory where your APK is located. Ensure ADB is installed and configured (it comes with Android Studio).
3.  **Install APK**: Use the following command to install the APK:

    ```bash
    adb install app-release.apk
    ```

    If you have multiple devices connected, you might need to specify the device:

    ```bash
    adb -s <device_id> install app-release.apk
    ```

    You can find `<device_id>` by running `adb devices`.

## Troubleshooting

*   **"App not installed" error**: Ensure you have enough storage space on your Android TV. Also, check if you have enabled installation from unknown sources.
*   **App crashes on launch**: This could be due to missing permissions or issues with the Flutter build. Try rebuilding the APK after running `flutter clean`.
*   **D-Pad navigation issues**: Ensure your Android TV remote is properly paired and that the app is built with the correct focus handling for TV devices.

This guide should help you successfully compile and install your IPTV application. Enjoy your cinematic experience!
