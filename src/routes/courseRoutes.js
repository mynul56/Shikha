const express = require('express');
const { getCourses, getCourseById, createCourse } = require('../controllers/courseController');
const { protect, instructor } = require('../middleware/authMiddleware');

const router = express.Router();

router.route('/').get(getCourses).post(protect, instructor, createCourse);
router.route('/:id').get(getCourseById);

module.exports = router;
