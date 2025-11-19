# Face Recognition Attendance System - Web Interface

A modern, responsive web-based front-end for the Face Recognition Attendance System built with Flask.

## Features

### 📊 Dashboard
- **Real-time Statistics**: Total students, present/absent count, weekly averages
- **Visual Analytics**: Branch-wise distribution charts and attendance trends
- **Recent Activity**: Live feed of recent attendance records
- **Auto-refresh**: Automatically updates every 30 seconds

### 👥 Student Management
- **Complete CRUD Operations**: Add, edit, view, and delete students
- **Detailed Information**: Student ID, name, email, phone, branch, year, section
- **Image Tracking**: Monitor number of captured images per student
- **Batch Operations**: Manage multiple students efficiently

### 📸 Image Capture Interface
- **Guided Process**: Step-by-step instructions for optimal image capture
- **Best Practices**: Tips for lighting, positioning, and variety
- **Student Selection**: Choose from existing students or add new names
- **Configurable Count**: Set number of images to capture (30-200)

### 🎥 Live Recognition
- **Real-time Video Feed**: Live camera stream with face detection
- **Visual Feedback**: Green boxes for recognized faces, red for unknown
- **Confidence Display**: Shows recognition confidence percentage
- **Auto-logging**: Automatically records attendance when faces are recognized
- **Session Statistics**: Track recognition count and session duration

### 📋 Attendance Records
- **Advanced Filtering**: Filter by date range and student name
- **Visual Trends**: Daily attendance trend charts
- **Top Attendees**: Bar chart of most regular students
- **Export Functionality**: Download attendance data as CSV
- **Responsive Table**: Easy-to-read attendance logs with pagination

### 📈 Reports & Analytics
- **Pre-defined Reports**: Daily, weekly, and monthly reports
- **Custom Date Range**: Generate reports for any date range
- **Student-specific Reports**: Individual attendance reports
- **Attendance Statistics**: Overall and category-wise attendance rates
- **Low Attendance Alerts**: Identify students with attendance below 75%

## Technology Stack

### Backend
- **Flask**: Python web framework
- **OpenCV**: Computer vision and face recognition
- **Pandas**: Data manipulation and analysis
- **NumPy**: Numerical computing

### Frontend
- **Bootstrap 5**: Responsive UI framework
- **Chart.js**: Interactive charts and graphs
- **Font Awesome**: Icons
- **Vanilla JavaScript**: Client-side interactivity

## Installation

### 1. Install Dependencies

```bash
# Install Python dependencies
pip install -r requirements_web.txt

# Make sure opencv-contrib-python is installed (includes face recognition)
pip install opencv-contrib-python
```

### 2. Project Structure

```
face-recognition-attendance/
│
├── app.py                          # Main Flask application
├── capture.py                      # Image capture script
├── train.py                        # Model training script
├── utils.py                        # Utility functions
│
├── templates/                      # HTML templates
│   ├── base.html                   # Base template
│   ├── index.html                  # Dashboard
│   ├── students.html               # Student management
│   ├── capture.html                # Image capture
│   ├── recognition.html            # Live recognition
│   ├── attendance.html             # Attendance records
│   └── reports.html                # Reports
│
├── static/                         # Static files
│   ├── css/
│   │   └── style.css              # Custom styles
│   └── js/
│
├── dataset/                        # Face images (auto-created)
│   └── [StudentName]/
│       ├── 1.jpg
│       ├── 2.jpg
│       └── ...
│
├── models/                         # Trained models (auto-created)
│   ├── face_recognizer.yml
│   ├── labels.pickle
│   └── haarcascade_frontalface_default.xml
│
├── attendance.csv                  # Attendance records
└── students_database.json          # Student information database
```

## Usage

### 1. Start the Web Server

```bash
python app.py
```

The application will be available at: `http://localhost:5000`

### 2. Workflow

#### Step 1: Add Students
1. Navigate to **Students** page
2. Click **"Add New Student"**
3. Fill in student details (ID, name, branch, year, etc.)
4. Click **"Add Student"**

#### Step 2: Capture Face Images
1. Navigate to **Capture Images** page
2. Select a student from dropdown or enter name manually
3. Set number of images (recommended: 60-100)
4. Click **"Start Capture"**
5. Run the command shown in your terminal:
   ```bash
   python capture.py --name "StudentName" --count 60
   ```
6. Follow on-screen instructions during capture
7. Press 'q' to quit early if needed

#### Step 3: Train the Model
1. After capturing images for all students
2. Click **"Train Model"** button in the sidebar
3. Wait for training to complete
4. Model will be saved automatically

#### Step 4: Run Live Recognition
1. Navigate to **Live Recognition** page
2. Camera feed will start automatically
3. Recognized faces will be marked with green boxes
4. Attendance is logged automatically
5. Click **"Stop"** when done

#### Step 5: View Attendance & Reports
1. Navigate to **Attendance Records** to view all records
2. Use filters to search by date or student name
3. Export data using **"Export CSV"** button
4. Navigate to **Reports** for detailed analytics

## Configuration

### Modify Recognition Threshold

In `app.py`, adjust the confidence threshold:

```python
if confidence < 70:  # Lower = more lenient, Higher = more strict
    name = label_names.get(label, "Unknown")
```

### Change Auto-refresh Interval

In templates, modify the refresh interval (in milliseconds):

```javascript
setInterval(() => {
    loadDashboardStats();
    loadRecentAttendance();
}, 30000);  // 30 seconds
```

### Customize Branches

Edit the branch options in `templates/students.html`:

```html
<select class="form-select" id="studentBranch">
    <option value="Computer Science">Computer Science</option>
    <option value="Information Technology">Information Technology</option>
    <!-- Add more branches here -->
</select>
```

## API Endpoints

### Student Management
- `GET /api/students` - Get all students
- `GET /api/students/<id>` - Get single student
- `POST /api/students` - Add new student
- `PUT /api/students/<id>` - Update student
- `DELETE /api/students/<id>` - Delete student

### Attendance
- `GET /api/attendance` - Get attendance records (with filters)
- `GET /api/recent-attendance` - Get recent attendance
- `GET /api/export-attendance` - Export CSV

### Dashboard
- `GET /api/dashboard-stats` - Get dashboard statistics

### Recognition
- `GET /video_feed` - Video stream with face recognition
- `POST /api/train-model` - Train face recognition model
- `POST /api/capture-start` - Start image capture

## Features in Detail

### Dashboard
- **Real-time Stats**: Displays current attendance status
- **Charts**: Visual representation of data using Chart.js
- **Recent Activity**: Shows last 10 attendance entries
- **Auto-refresh**: Updates every 30 seconds without page reload

### Student Management
- **Validation**: Prevents duplicate student IDs
- **Complete Info**: Stores comprehensive student details
- **Image Tracking**: Shows how many images captured per student
- **Safe Deletion**: Confirms before deleting and removes associated data

### Live Recognition
- **Video Streaming**: Uses Flask's Response with multipart/x-mixed-replace
- **Face Detection**: Haar Cascade for fast face detection
- **LBPH Recognition**: Local Binary Pattern Histogram for recognition
- **Confidence Score**: Shows recognition confidence percentage
- **Auto-attendance**: Logs attendance automatically when face recognized

### Attendance System
- **CSV Storage**: Simple and portable attendance storage
- **Date/Time Logging**: Records exact date and time of attendance
- **No Duplicates**: Prevents multiple entries per session
- **Easy Export**: One-click CSV export for external analysis

## Troubleshooting

### Camera Not Working
- Ensure camera permissions are granted
- Check if another application is using the camera
- Try changing camera index in `generate_frames()`: `cv2.VideoCapture(1)`

### Model Not Recognizing Faces
- Ensure you've trained the model after capturing images
- Capture more images (60-100 recommended per person)
- Check lighting conditions during capture
- Adjust confidence threshold in code

### Flask Server Issues
- Check if port 5000 is already in use
- Change port in `app.py`: `app.run(port=5001)`
- Ensure all dependencies are installed

### Haar Cascade Not Found
- The file downloads automatically on first run
- If download fails, manually download from: 
  https://github.com/opencv/opencv/tree/master/data/haarcascades
- Place in `models/` directory

## Security Considerations

### Production Deployment
1. **Change Secret Key**: Update `app.config['SECRET_KEY']` in `app.py`
2. **Disable Debug Mode**: Set `debug=False` in `app.run()`
3. **Use HTTPS**: Deploy behind a reverse proxy with SSL
4. **Add Authentication**: Implement user login system
5. **Rate Limiting**: Add rate limiting to prevent abuse
6. **Input Validation**: Validate all user inputs server-side

### Data Privacy
- Store face images securely
- Implement access controls
- Regular backup of attendance data
- Comply with data protection regulations (GDPR, etc.)

## Future Enhancements

- [ ] User authentication and role-based access
- [ ] Email notifications for low attendance
- [ ] SMS alerts to parents/guardians
- [ ] Multiple camera support
- [ ] Deep learning models (FaceNet, ArcFace)
- [ ] Mobile app integration
- [ ] Cloud storage for face images
- [ ] Advanced analytics and insights
- [ ] PDF report generation
- [ ] Multi-language support

## Browser Compatibility

- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Edge 90+
- ✅ Safari 14+
- ✅ Opera 76+

## Performance Tips

1. **Optimize Image Count**: 60-80 images per person is optimal
2. **Regular Model Training**: Retrain after adding multiple students
3. **Database Maintenance**: Periodically archive old attendance records
4. **Image Cleanup**: Remove low-quality captured images
5. **Server Resources**: Use dedicated machine for better performance

## License

This project is open-source and available for educational purposes.

## Support

For issues and questions:
1. Check the troubleshooting section
2. Review the original backend README
3. Ensure all dependencies are properly installed

## Credits

- OpenCV for face recognition
- Bootstrap for UI components
- Chart.js for data visualization
- Flask for web framework

---

**Note**: This is a educational project. For production use, implement proper security measures, authentication, and data protection practices.
