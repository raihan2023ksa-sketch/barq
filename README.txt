Barq - Simple Image App
-----------------------

This is a minimal Flutter project prepared for Codemagic debug APK builds.

How to use:
1. Replace the three placeholder images:
   - assets/images/image1.jpg
   - assets/images/image2.jpg
   - assets/images/image3.jpg

2. Zip the `barq` folder (or use this ZIP) and upload to Codemagic:
   https://codemagic.io/start

3. On Codemagic choose:
   - Start new build -> Upload .zip
   - Flutter -> Android -> Build APK
   - Build type: Debug

4. When build finishes, download the APK and install on your Android device.

Notes:
- This project is configured to open the default mail app (Gmail on many devices) by using a mailto: link.
- If the mail app doesn't open, try installing Gmail or another email client.

