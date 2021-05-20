module ModelHelper
  def test_is_required(model, field)
    model_instance = create(model)
    model_instance[field] = nil
    expect(model_instance).to_not be_valid
    expect(
      model_instance.errors.messages[field]
    ).to include("can't be blank")
  end
  def test_is_unique(model, field)
    instance_a = create(model)
    instance_b = create(model)
    instance_b[field] = instance_a[field]
    expect(instance_b).to_not be_valid
    expect(instance_b.errors.messages[field]).to include('has already been taken')
  end
end

RSpec.configure do |c|
  c.include ModelHelper
end
