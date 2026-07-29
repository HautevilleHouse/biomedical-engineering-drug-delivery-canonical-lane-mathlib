import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  rocCurve : Prop
  likelihoodRatio : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  rocCurveClosed : D.rocCurve
  likelihoodRatioClosed : D.likelihoodRatio

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧
  D.specificity ∧
  D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧
  D.rocCurve ∧
  D.likelihoodRatio

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.rocCurveClosed E.likelihoodRatioClosed))))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse
