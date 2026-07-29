import canonicalLaneMathlib.AdmissibleClass

/-!
# Compartment Model Package

This module defines the formal structure for compartmental pharmacokinetic models.
-/

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure CompartmentModelPackage where
  numberOfCompartments : Nat
  compartmentVolumes : List Nat
  transferRateMatrix : List (List ℝ)
  eliminationRates : List ℝ
  initialConditions : List ℝ
  modelWellDefined : Prop
  positivityPreserving : Prop
  massConservation : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  modelWellDefinedClosed : M.modelWellDefined
  positivityPreservingClosed : M.positivityPreserving
  massConservationClosed : M.massConservation

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.modelWellDefined ∧ M.positivityPreserving ∧ M.massConservation

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.modelWellDefinedClosed
    (And.intro E.positivityPreservingClosed E.massConservationClosed)

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse