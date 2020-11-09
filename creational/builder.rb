class CourseBuilder
  attr_reader :course

  def initialize
    @course = Course.new
  end

  def course
    @course
  end

  def add_document(number, type)
    number.times { course.build_document(type) }
  end

  def add_presentation(type = 'video')
    case type
    when 'video' then course.build_video_presentation
    else
      course.build_audio_presentation
    end
  end

  def add_assessment
    course.build_assesment
  end

  def configue_assessment(question_number)
    question_number.times { course.questions << course.assessment.add_question }
  end
end

class Course
  attr_accessor :documents, :presentations, :questions, :assessment

  def initialize
    @documents = []
    @presentations = []
    @questions = []
  end

  def build_document(type)
    @documents << Document.new(type)
  end

  def build_video_presentation
    @presentations << VideoPresentation.new
  end

  def build_audio_presentation
    @presentations << AudioPresentation.new
  end

  def build_assesment
    @assessment = Assessment.new
  end
end

class Assessment
  def add_question
    Question.new
  end
end

class Document
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

class VideoPresentation;end

class Question;end

class AudioPresentation;end

course_builder = CourseBuilder.new
course_builder.add_document(2, 'html')
course_builder.add_presentation
course_builder.add_presentation('audio')
course_builder.add_assessment
course_builder.configue_assessment(2)

p course_builder.course
