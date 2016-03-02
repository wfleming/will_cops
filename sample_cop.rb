$will_sample_cop_emitted = false

module WillCops
  class SampleCop < RuboCop::Cop::Cop
    def on_send(node)
      unless $will_sample_cop_emitted
        $will_sample_cop_emitted = true
        _receiver, method_name, *_args = *node
        add_offense(node, :expression, "WILL'S SAMPLE COP FOR ##{method_name}")
      end
    end
  end
end
