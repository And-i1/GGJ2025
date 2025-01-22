function myFunc() {
    if (!document.getElementById('enable_motion')) {
        const btn = document.createElement('button');
        btn.id = 'enable_motion';
        btn.textContent = 'Enable Motion';

        // Minimal styling so it's visible on top of the Godot canvas
        btn.style.position = 'absolute';
        btn.style.top = '20px';
        btn.style.left = '20px';
        btn.style.zIndex = '9999';  // ensure it's on top
        btn.style.padding = '1em';
        btn.style.fontSize = '1em';

        btn.addEventListener('click', function () {
            // iOS Safari requires DeviceOrientationEvent.requestPermission()
            if (typeof DeviceOrientationEvent !== 'undefined' &&
                typeof DeviceOrientationEvent.requestPermission === 'function') {
                btn.textContent = 'Requesting';

                DeviceOrientationEvent.requestPermission()
                    .then((response) => {
                        if (response === 'granted') {
                            console.log('Device orientation permission granted!');
                            // Optionally remove or hide the button:
                            btn.remove();
                        } else {
                            console.log('Device orientation permission denied:', response);
                            btn.textContent = 'Denied';
                        }
                    })
                    .catch((err) => {
                        console.error('Error requesting orientation permission:', err);
                        btn.textContent = 'Error';
                    });

            } else {
                // Other browsers don't need explicit requestPermission
                console.log('Orientation permission not required or not supported here.');
                // Optionally remove or hide the button:
                btn.remove();
            }
        });

        document.body.appendChild(btn);
    }
}
