import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  rateConstants : Nat -> Prop
  volumeDistribution : Prop
  eliminationRate : Prop
  absorptionRate : Prop
  initialCondition : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  numCompartmentsPositive : C.numCompartments > 0
  rateConstantsDefined : C.rateConstants C.numCompartments
  volumeDistributionClosed : C.volumeDistribution
  eliminationRateClosed : C.eliminationRate
  absorptionRateClosed : C.absorptionRate
  initialConditionClosed : C.initialCondition

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.numCompartments > 0 ∧
  C.rateConstants C.numCompartments ∧
  C.volumeDistribution ∧
  C.eliminationRate ∧
  C.absorptionRate ∧
  C.initialCondition

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.numCompartmentsPositive
    (And.intro E.rateConstantsDefined
      (And.intro E.volumeDistributionClosed
        (And.intro E.eliminationRateClosed
          (And.intro E.absorptionRateClosed E.initialConditionClosed))))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse
