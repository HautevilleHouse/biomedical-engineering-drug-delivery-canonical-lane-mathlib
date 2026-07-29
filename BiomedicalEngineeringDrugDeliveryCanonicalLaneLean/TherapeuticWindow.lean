import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure TherapeuticWindow where
  minimumEffectiveConcentration : Prop
  maximumSafeConcentration : Prop
  dosingInterval : Prop
  steadyStateReached : Prop
  toxicityAvoided : Prop

structure TherapeuticWindowEvidence (W : TherapeuticWindow) where
  minimumEffectiveConcentrationClosed : W.minimumEffectiveConcentration
  maximumSafeConcentrationClosed : W.maximumSafeConcentration
  dosingIntervalClosed : W.dosingInterval
  steadyStateReachedClosed : W.steadyStateReached
  toxicityAvoidedClosed : W.toxicityAvoided

def TherapeuticWindowClosed (W : TherapeuticWindow) : Prop :=
  W.minimumEffectiveConcentration ∧ W.maximumSafeConcentration ∧ W.dosingInterval ∧ W.steadyStateReached ∧ W.toxicityAvoided

theorem therapeutic_window_closed_from_evidence (W : TherapeuticWindow) (E : TherapeuticWindowEvidence W) :
    TherapeuticWindowClosed W := by
  exact And.intro E.minimumEffectiveConcentrationClosed
    (And.intro E.maximumSafeConcentrationClosed
      (And.intro E.dosingIntervalClosed
        (And.intro E.steadyStateReachedClosed E.toxicityAvoidedClosed)))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse