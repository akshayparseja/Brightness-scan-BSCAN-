# B-Scan Medical Imaging System

An advanced ophthalmological imaging system that combines B-scan ultrasound technology with comprehensive patient management capabilities. This application helps eye care professionals manage patient examinations, store and analyze B-scan images, and maintain detailed medical records.

## 🔥 Key Features

### 👁 Imaging Capabilities
- B-scan ultrasound image capture and analysis
- Real-time video recording and playback
- Image annotation and measurement tools
- Advanced scan data management

### 👨‍⚕️ Doctor Features
- Personalized doctor profiles
- Customizable lens presets
- Patient assignment system
- Email notifications
- Scan history tracking

### 👥 Patient Management
- Detailed patient records
- Eye examination history
- Left/Right eye measurements (LK/RK)
- Gender and age tracking
- Contact information management

### 💾 Data Management
- Secure database storage
- Easy search and retrieval
- Patient-doctor relationship tracking
- Examination history
- Backup capabilities

## 🚀 Getting Started

### Prerequisites
- Qt 5.12.2 or higher
- OpenCV libraries
- C++ compiler with C++11 support
- SQLite3

### Installation

1. Clone the repository
```bash
git clone [repository-url]
cd bscan_v2
```

2. Build the QML version
```bash
cd src/bscan_qml/bscan
qmake
make
```

3. Build the Qt widgets version (alternative interface)
```bash
cd src/bscan_qt/bscan
qmake
make
```

## 📁 Project Structure

```
bscan_v2/
├── src/
│   ├── bscan_qml/               # Modern QML interface
│   │   └── bscan/
│   │       ├── DatabaseHandler/ # Database management
│   │       ├── General/        # Common utilities
│   │       └── icons/         # UI assets
│   └── bscan_qt/               # Traditional Qt interface
│       └── bscan/
└── db/                         # Database files
```

## 💻 Technologies Used

- **Frontend**: Qt Quick (QML) and Qt Widgets
- **Backend**: C++ with Qt framework
- **Database**: SQLite with custom handlers
- **Image Processing**: OpenCV integration
- **Build System**: QMake

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ✨ Development Features

- Modern QML-based user interface
- Traditional Qt widgets interface option
- Modular architecture
- Database abstraction layer
- Custom image processing capabilities

## 📝 Documentation

The codebase includes:
- Database handlers for patient, doctor, and scan management
- QML components for modern UI
- Qt widgets for traditional interface
- OpenCV integration for image processing
- Comprehensive data models

## 🔒 Security

- Secure patient data storage
- Access control mechanisms
- Data encryption support
- HIPAA compliance considerations

## 🌟 Future Enhancements

- Cloud synchronization
- AI-powered image analysis
- Remote consultation features
- Enhanced reporting capabilities
- Mobile application integration

## 📄 License

This project is licensed under the Mozilla Public License 2.0 - see the [LICENSE](LICENSE) file for details.

### Why MPL-2.0?
- Provides patent protection which is crucial for medical software
- Allows commercial use while maintaining open source requirements
- Compatible with both proprietary and open source software
- Well-understood in the healthcare industry
- Requires disclosure of source code modifications

## ✍️ Authors

- [Your Name]
- [Contributors]

## 🙏 Acknowledgments

- Qt Framework developers
- OpenCV community
- Medical professionals who provided feedback
- Beta testers and early adopters