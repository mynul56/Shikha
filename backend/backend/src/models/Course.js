const mongoose = require('mongoose');

const courseSchema = new mongoose.Schema({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User',
    },
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true,
        default: 0.0,
    },
    thumbnail: {
        type: String,
        required: true,
    },
    modules: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Module',
    }],
    rating: {
        type: Number,
        required: true,
        default: 0,
    },
    numReviews: {
        type: Number,
        required: true,
        default: 0,
    },
}, { timestamps: true });

const Course = mongoose.model('Course', courseSchema);
module.exports = Course;
