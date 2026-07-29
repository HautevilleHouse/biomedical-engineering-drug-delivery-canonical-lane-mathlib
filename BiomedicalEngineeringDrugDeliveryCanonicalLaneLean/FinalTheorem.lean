import canonicalLaneMathlib.FinalTheorem

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

def ConstrainedDrugDeliveryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_drug_delivery_endgame (A : AdmissibleClass) :
    ConstrainedDrugDeliveryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse